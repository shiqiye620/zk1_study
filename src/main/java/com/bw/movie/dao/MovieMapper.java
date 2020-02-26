package com.bw.movie.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;

import com.bw.movie.bean.Movie;
import com.bw.movie.vo.MovieVO;

public interface MovieMapper {
	List<Movie> selects(MovieVO movieVOs);

	List<Movie> selects();
	boolean delete(Integer[] sids);
}
