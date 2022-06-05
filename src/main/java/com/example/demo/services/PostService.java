package com.example.demo.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.demo.models.Post;
import com.example.demo.repositories.PostRepository;


@Service
public class PostService {

	private final PostRepository postRepo;

	public PostService(PostRepository postRepo) {
		this.postRepo = postRepo;
	}

	public List<Post> getAll() {
		return postRepo.findAll();
	}

	public Post create(Post newPost) {
		return this.postRepo.save(newPost);

	}

	public Post find(Long id) {
		Optional<Post> optionalPost = postRepo.findById(id);
		if (optionalPost.isPresent()) {
			return optionalPost.get();
		} else {
			return null;
		}
	}

	public Post update(Post post) {
		return postRepo.save(post);
	}

	public void delete(Long id) {
		postRepo.deleteById(id);
	}
}