package ru.vsd.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import ru.vsd.model.Post;

public interface PostService {
    Page<Post> findAll(Pageable pageable);

    Post save(Post post);
}
