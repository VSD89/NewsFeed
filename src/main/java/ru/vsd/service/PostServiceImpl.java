package ru.vsd.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import ru.vsd.dao.PostDao;
import ru.vsd.model.Post;

@Service
public class PostServiceImpl implements PostService {
    private PostDao postDao;

    @Autowired
    public PostServiceImpl(PostDao postDao) {
        this.postDao = postDao;
    }

    /**
     * Method finds all items
     *
     * @param pageable implementation of Pageable interface
     * @return all posts
     */
    @Override
    public Page<Post> findAll(Pageable pageable) {
        return postDao.findAll(pageable);
    }

    /**
     * Method saves post
     *
     * @param post post to save
     * @return post after saving from postDao
     */
    @Override
    public Post save(Post post) {
        return postDao.save(post);
    }

}
