package com.DAO;

import java.util.List;

import com.entity.BookDtls;

public interface BookDAO {

	Boolean addBooks(BookDtls b);
	List<BookDtls> getAllBooks();
	BookDtls getBookById(int id);
	Boolean updateBook(BookDtls b);
	Boolean deletBook(int id);
	List<BookDtls> getNewBooks();
	List<BookDtls> getRecentBooks();
	List<BookDtls> getOldBooks();
	List<BookDtls> getAllNewBooks();
	List<BookDtls> getAllRecentBooks();
	List<BookDtls> getAllOldBooks();
	List<BookDtls> getOldBookByUser(String email,String cate);
	Boolean oldBookdelete(int bid,String email,String cate);
	public List<BookDtls> getAllBookBySearch(String ch);
}
