package com.bw.movie.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bw.movie.bean.Movie;
import com.bw.movie.dao.MovieMapper;
import com.bw.movie.service.MovieService;
import com.bw.movie.vo.MovieVO;
@Service
public class MovieServiceImpl implements MovieService{
	@Autowired
	private MovieMapper mapper;

	@Override
	public List<Movie> selects(MovieVO movieVOs) {
		// TODO Auto-generated method stub
		return mapper.selects(movieVOs);
	}

	@Override
	public List<Movie> selects() {
		// TODO Auto-generated method stub
		return mapper.selects();
	}

	@Override
	public boolean delete(Integer[] sids) {
		// TODO Auto-generated method stub
		return mapper.delete(sids);
	}
}
