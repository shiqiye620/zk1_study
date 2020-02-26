package com.bw.movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bw.movie.bean.Movie;
import com.bw.movie.service.MovieService;
import com.bw.movie.vo.MovieVO;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class MovieController {
	
	@Autowired
	private MovieService service;
	
	@RequestMapping("selects")
	public String list(Model m,MovieVO movieVOs) {
		if(movieVOs.getPageNum()==null || "".equals(movieVOs.getPageNum())) {
			movieVOs.setPageNum(1);
		}
		PageHelper.startPage(movieVOs.getPageNum(),3);
		List<Movie> movies=service.selects(movieVOs);
		PageInfo<Movie> page = new PageInfo<Movie>(movies);
		m.addAttribute("page",page);
		m.addAttribute("movies",movies);
		m.addAttribute("movieVOs", movieVOs);
		return "movies";
	}
	
	@RequestMapping("select")
	public String list2(Model m) {
		List<Movie> movies=service.selects();
		m.addAttribute("movies",movies);
		return "movies";
	}
	@ResponseBody
	@RequestMapping("delete")
	public boolean delete(Integer[] sids) {
		boolean flag=service.delete(sids);
		return flag;
			
	}
	
}
