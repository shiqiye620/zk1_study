package com.bw.movie.service;

import java.util.List;

import com.bw.movie.bean.Movie;
import com.bw.movie.vo.MovieVO;

public interface MovieService {

	List<Movie> selects(MovieVO movieVOs);

	List<Movie> selects();

	boolean delete(Integer[] sids);
}
