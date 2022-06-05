package com.example.demo.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.demo.models.Show;
import com.example.demo.repositories.ShowRepository;


@Service
public class ShowService {

	private final ShowRepository showRepo;

	public ShowService(ShowRepository showRepo) {
		this.showRepo = showRepo;
	}

	public List<Show> getAll() {
		return showRepo.findAll();
	}

	public Show create(Show newShow) {
		return this.showRepo.save(newShow);

	}

	public Show find(Long id) {
		Optional<Show> optionalShow = showRepo.findById(id);
		if (optionalShow.isPresent()) {
			return optionalShow.get();
		} else {
			return null;
		}
	}

	public Show update(Show show) {
		return showRepo.save(show);
	}

	public void delete(Long id) {
		showRepo.deleteById(id);
	}
}