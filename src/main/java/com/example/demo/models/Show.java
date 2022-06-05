package com.example.demo.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "shows")

public class Show {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotNull
	@Size(min = 5, max = 200, message="You must name the anime")
	private String showTitle;
	
	@NotNull
	@Size(min = 5, max = 200, message="You must have an author.")
	private String author;
	
	@NotNull
	@Size(min = 5, max = 1000, message="You must the anime a description.")
	private String description;
	
	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedAt;
	
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
	
	@OneToMany(mappedBy="show", fetch = FetchType.LAZY)
    private List<Post> posts;

	public Show() {
		
	}
	
	public Show (String showTitle, String author, String description) {
		this.showTitle = showTitle;
		this.author = author;
		this.description = description;
	}

	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public String getShowTitle() {
		return showTitle;
	}



	public void setShowTitle(String showTitle) {
		this.showTitle = showTitle;
	}



	public String getAuthor() {
		return author;
	}



	public void setAuthor(String author) {
		this.author = author;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public Date getCreatedAt() {
		return createdAt;
	}



	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}



	public Date getUpdatedAt() {
		return updatedAt;
	}



	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}



	public List<Post> getPosts() {
		return posts;
	}



	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}
	
	
	
}

