package com.ly.test.service;

import com.ly.entity.Book;
import com.ly.service.BookService;
import com.ly.test.BaseTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class BookServiceImplTest extends BaseTest {

    @Autowired
    private BookService bookService;

    @Test
    public void getById() {
        Book book = bookService.getById(1000);
        System.out.println(book);
    }
}
