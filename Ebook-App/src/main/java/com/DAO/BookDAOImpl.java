package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;

public class BookDAOImpl implements BookDAO {

	private Connection con;

	public BookDAOImpl(Connection con) {
		super();
		this.con = con;
	}

	@Override
	public Boolean addBooks(BookDtls b) {

		boolean f = false;
		try {

			PreparedStatement ps = con.prepareStatement(
					"insert into book_dtls(bookName,author,price,bookCategory,status,photo,email)values(?,?,?,?,?,?,?)");
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getCategories());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhotoName());
			ps.setString(7, b.getEmail());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		}

		catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}

	@Override
	public List<BookDtls> getAllBooks() {

		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;

		try {

			PreparedStatement ps = con.prepareStatement("select*from book_dtls");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategories(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

				list.add(b);

			}

		}

		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public BookDtls getBookById(int id) {

		BookDtls b = null;
		try {

			PreparedStatement ps = con.prepareStatement("select * from book_dtls where bookId=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategories(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));

			}
		}

		catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public Boolean updateBook(BookDtls b) {
		Boolean f = false;
		try {
			
			PreparedStatement ps = con.prepareStatement("update book_dtls set bookName=?,author=?,price=?,status=? where bookId=?");
			ps.setString(1,b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());
			int i = ps.executeUpdate();
			if(i==1)
			{
				f =true;
			}	
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public Boolean deletBook(int id) {
		
		boolean f= false;
		try {
			
			PreparedStatement ps = con.prepareStatement("delete from book_dtls where bookId=?");
			ps.setInt(1, id);
		int i = 	ps.executeUpdate();
		
		if(i!=0)
		{
			f =true;
		}
			
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookDtls> getNewBooks() {
		
		List<BookDtls> list = new ArrayList<>();
		BookDtls b = null;
		try {
			
			PreparedStatement ps = con.prepareStatement("SELECT * from book_dtls where bookCategory=? and status=? order by bookId DESC");

			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet  rs = ps.executeQuery();
			int i=1;
			
			while(rs.next() && i<=4)
			{
				b = new BookDtls();
			
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategories(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;

			
			}
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getRecentBooks() {
		
		List<BookDtls> list = new ArrayList<>();
		BookDtls b = null;
		try {
			
			PreparedStatement ps = con.prepareStatement("SELECT * from book_dtls where status=? order by bookId DESC");

			ps.setString(1, "Active");
		
			ResultSet  rs = ps.executeQuery();
			int i=1;
			
			while(rs.next() && i<=4)
			{
				b = new BookDtls();
			
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategories(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;

			
			}
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getOldBooks() {

		List<BookDtls> list = new ArrayList<>();
		BookDtls b = null;
		try {
			
			PreparedStatement ps = con.prepareStatement("SELECT * from book_dtls where bookCategory=? and status=? order by bookId DESC");

			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet  rs = ps.executeQuery();
			int i=1;
			
			while(rs.next() && i<=4)
			{
				b = new BookDtls();
			
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategories(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;

			
			}
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getAllNewBooks() {
		List<BookDtls> list = new ArrayList<>();
		BookDtls b = null;
		try {
			
			PreparedStatement ps = con.prepareStatement("SELECT * from book_dtls where bookCategory=? and status=? order by bookId DESC");

			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet  rs = ps.executeQuery();
			int i=1;
			
			while(rs.next() )
			{
				b = new BookDtls();
			
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategories(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			

			
			}
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getAllRecentBooks() {
		List<BookDtls> list = new ArrayList<>();
		BookDtls b = null;
		try {
			
			PreparedStatement ps = con.prepareStatement("SELECT * from book_dtls where status=? order by bookId DESC");

			ps.setString(1, "Active");
		
			ResultSet  rs = ps.executeQuery();
			int i=1;
			
			while(rs.next())
			{
				b = new BookDtls();
			
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategories(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			
			}
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getAllOldBooks() {
		List<BookDtls> list = new ArrayList<>();
		BookDtls b = null;
		try {
			
			PreparedStatement ps = con.prepareStatement("SELECT * from book_dtls where bookCategory=? and status=? order by bookId DESC");

			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet  rs = ps.executeQuery();
			int i=1;
			
			while(rs.next())
			{
				b = new BookDtls();
			
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategories(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			

			
			}
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getOldBookByUser(String email, String cate) {
	
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		
		
		try {
			
			PreparedStatement ps = con.prepareStatement("select*from book_dtls where email=? and bookCategory=? ");
			ps.setString(1, email);
			ps.setString(2, cate);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategories(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		return list;
	}

	@Override
	public Boolean oldBookdelete(int bid, String email, String cate) {
		
		boolean f = false;
		
		try {
			
			PreparedStatement ps = con.prepareStatement("delete from book_dtls where bookId=?   and bookCategory=? and email=?");
			ps.setInt(1, bid);
			ps.setString(2, cate);
			ps.setString(3, email);
			 int i= ps.executeUpdate();
			 
			 if(i==1)
			 {
				f = true; 
			 }
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookDtls> getAllBookBySearch(String ch) {

		List<BookDtls> list = new ArrayList<>();
		BookDtls b = null;
		try {
			
			PreparedStatement ps = con.prepareStatement("SELECT * from book_dtls where bookName like ? or bookCategory like ? or author like ? and status=? ");

			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			ResultSet  rs = ps.executeQuery();
			int i=1;
			
			while(rs.next() && i<=4)
			{
				b = new BookDtls();
			
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setCategories(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;

			
			}
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

}
