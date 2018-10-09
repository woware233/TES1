package com.tes1.evaluate.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tes1.evaluate.domain.Department;


public interface DepartmentMapper {
	//��ѯ���а༶
	List<Department> findalldepartment(Department department);
	//���Ӱ༶
	boolean addDepartment(Department department);
	//ͨ����ѯid �޸İ༶
	Department findallDepartmentById(Integer id);
	//�޸İ༶
	
	
	
	int getDepartmentListTotal(String filter);
	List<Department> getDepartmentList(@Param("page")int page, @Param("rows")int rows, @Param("filter")String filter);
	List<Department> findDepartmentById(Integer id);
	boolean updateDepartment(Department department);
	List<Department> findDepartment(Department department);
	int deleteDepartmentById(List<Integer> list);
}