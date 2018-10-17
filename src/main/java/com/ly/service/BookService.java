package com.ly.service;

import com.ly.entity.Book;

import java.util.List;

public interface BookService {
    Book getById(long bookId);
    List<Book> getList(int start, int pageNum);
    int addBook(Book book);
    int updateBook(Book book);
    int deleteBookId(long id);
}
