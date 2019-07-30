package ru.vsd.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;
import ru.vsd.dao.entity.PostEntity;
import ru.vsd.dao.repository.PostRepository;
import ru.vsd.model.Post;

@Repository
public class PostDaoJpa implements PostDao {
    private PostRepository postRepository;

    @Autowired
    public PostDaoJpa(PostRepository postRepository) {
        this.postRepository = postRepository;
    }

    /**
     * Method finds all items
     *
     * @param pageable implementation of Pageable interface
     * @return all posts
     */
    @Override
    public Page<Post> findAll(Pageable pageable) {
        return postRepository.findAll(pageable).map(this::convert);
    }

    /**
     * Method saves added posts
     *
     * @param post post to save
     * @return post after convertation ans saving
     */
    @Override
    public Post save(Post post) {
        return convert(postRepository.save(convert(post)));
    }

    /**
     * Method converts post to postEntity
     *
     * @param post post to convert
     * @return postEntity from post
     */
    private PostEntity convert(Post post) {
        return new PostEntity(post.getId(), post.getTitle(), post.getDate(), post.getContent(), post.getPicture());
    }

    /**
     * Method converts postEntity to post
     *
     * @param post postEntity to convert
     * @return post from postEntity
     */
    private Post convert(PostEntity post) {
        return new Post(post.getId(), post.getTitle(), post.getDate(), post.getContent(), post.getPicture());
    }
}
