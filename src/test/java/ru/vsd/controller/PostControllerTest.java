package ru.vsd.controller;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.ui.ExtendedModelMap;
import ru.vsd.model.Post;
import ru.vsd.service.PostService;

import java.util.Collections;
import java.util.Date;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

public class PostControllerTest {
    @Mock
    private PostService postService;

    @InjectMocks
    private PostController controller;

    @Before
    public void init() {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void getNewsList_whenAllOk() {
        Page<Post> page = new PageImpl<>(Collections.singletonList(new Post(1L, "title", new Date(100), "content", "picture")));
        PageRequest pageRequest = PageRequest.of(1, 1);
        ExtendedModelMap extendedModelMap = new ExtendedModelMap();
        when(postService.findAll(any(Pageable.class))).thenReturn(page);

        String path = controller.getAll(extendedModelMap, pageRequest);

        Assert.assertEquals("newsList", path);
    }

}