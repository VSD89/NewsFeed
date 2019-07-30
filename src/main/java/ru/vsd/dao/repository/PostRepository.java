package ru.vsd.dao.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;
import ru.vsd.dao.entity.PostEntity;


public interface PostRepository extends CrudRepository<PostEntity, Long> {
    Page<PostEntity> findAll(Pageable pageable);
}