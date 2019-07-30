package ru.vsd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
public class Post {

    private Long id;

    private String title;

    private Date date;

    private String content;

    private String picture;
}
