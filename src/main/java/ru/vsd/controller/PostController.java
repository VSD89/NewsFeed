package ru.vsd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import ru.vsd.controller.dto.PostDto;
import ru.vsd.model.Post;
import ru.vsd.service.PostService;

@Controller
public class PostController {

    private PostService postService;

    @Autowired
    public PostController(PostService postService) {
        this.postService = postService;
    }

    /**
     * Method to get the page with all news
     *
     * @param model    implementation of Model interface
     * @param pageable implementation of Pageable interface
     * @return page with all news
     */
    @GetMapping("/")
    public String getAll(Model model, @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable) {
        model.addAttribute("page", postService.findAll(pageable).map(this::convert));
        return "newsList";
    }

    /**
     * Method to get the page with fields for adding news
     *
     * @return page for adding post
     */
    @GetMapping("/add")
    public String addPage() {
        return "add";
    }

    /**
     * Method adds new post
     *
     * @param model implementation of Model interface
     * @param dto   postDto for adding
     * @return start page afrer adding new post or warning page in case of incorrect fields
     */
    @PostMapping("/add")
    public String save(Model model, @ModelAttribute PostDto dto) {
        if (dto.getContent().isEmpty() || dto.getTitle().isEmpty()) {
            return "warning";
        }
        model.addAttribute("dto", convert(postService.save(convert(dto))));
        return "redirect:/";
    }

    /**
     * Method converts post to postDto
     *
     * @param post post for convertation
     * @return new postDto from post
     */
    private PostDto convert(Post post) {
        return new PostDto(post.getId(), post.getTitle(), post.getDate(), post.getContent(), post.getPicture());
    }

    /**
     * Method converts postDto to post
     *
     * @param dto dto for convertation
     * @return new post from postDto
     */
    private Post convert(PostDto dto) {
        return new Post(dto.getId(), dto.getTitle(), dto.getDate(), dto.getContent(), dto.getPicture());
    }
}
