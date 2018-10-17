package com.ly.test.dao;

import com.ly.dao.BookDao;
import com.ly.entity.Book;
import com.ly.test.BaseTest;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class BookDaoTest extends BaseTest {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private BookDao bookDao;

    @Test
    public void addBook() {
        Book book = new Book();
        book.setDetail("数学");
        book.setName("数学");
        book.setNumber(10);
        int num = bookDao.addBook(book);
    }

    @Test
    public void queryById() {
        Book book = bookDao.queryById(1000);
        System.out.println(book);
    }

    @Test
    public void queryALl() {
        List<Book>  books = bookDao.queryAll(1, 1000);
        System.out.println(books);
    }

    @Test
    public void updateBook() {
        Book book = new Book();
        book.setBookId(1004);
        book.setDetail("js");
        book.setNumber(9);
        book.setName("js");
        int num = bookDao.updateBook(book);
    }

    @Test
    public void deleteBookById() {
        bookDao.deleteBookById(1004);
    }
}
