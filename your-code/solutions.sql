

select authors.au_id as AUTHOR_ID, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
	from authors
	left join titleauthor
    on authors.au_id=titleauthor.au_id
    left join titles
    on titles.title_id=titleauthor.title_id
    left join publishers
    on publishers.pub_id=titles.pub_id  
  ;





select authors.au_id as AUTHOR_ID, authors.au_lname, authors.au_fname, count(titles.title), publishers.pub_name
	from authors
	left join titleauthor
    on authors.au_id=titleauthor.au_id
    left join titles
    on titles.title_id=titleauthor.title_id
    left join publishers
    on publishers.pub_id=titles.pub_id
    
    group by AUTHOR_ID, pub_name
    ;



select authors.au_id as AUTHOR_ID, authors.au_lname, authors.au_fname, sum(sales.qty) as total
	from authors
	left join titleauthor
    on authors.au_id=titleauthor.au_id
    left join titles
    on titles.title_id=titleauthor.title_id
    left join sales 
    on sales.title_id= titles.title_id
    group by AUTHOR_ID
    order by total desc
    limit 3    
    ;
    


select authors.au_id as AUTHOR_ID, authors.au_lname, authors.au_fname, coalesce(sum(sales.qty), 0) as total
	from authors
	left join titleauthor
    on authors.au_id=titleauthor.au_id
    left join titles
    on titles.title_id=titleauthor.title_id
    left join sales 
    on sales.title_id= titles.title_id
    group by AUTHOR_ID
    order by total desc  
    
