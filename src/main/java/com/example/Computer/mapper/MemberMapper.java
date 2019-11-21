package com.example.Computer.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;



public interface MemberMapper {

	@Select("select now()")
	public String getTime() throws Exception;;

	@Select("select uname from member where uid = #{uid}")
	public String getUname(@Param("uid") String uid) throws Exception;;
	

	@Update("update member set loginip=#{ip}, lastlogin=now() where uid = #{uid}")
	public void updateLogin(@Param("uid") String uid, @Param("ip") String ip) throws Exception;
	
}
