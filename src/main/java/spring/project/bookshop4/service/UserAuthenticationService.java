package spring.project.bookshop4.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import spring.project.bookshop4.vo.UserVO;

//UserDetailsService	:	스프링 프레임워크에 내장된 인터페이스
//UserDatailsService	:	users 테이블의 정보를 가지고 인증 처리를 위해 사용자 상세정보를 제공하는 인터페이스	
//로그인 인증을 처리하는 빈
public class UserAuthenticationService implements UserDetailsService{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	public UserAuthenticationService(SqlSessionTemplate sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	/*
	  	로그인 인증을 처리하는 핵심 코드
	 	매개변수가 userid뿐이지만 패스워드까지 전달된다(매개변수를 username => userid로 수정)
	 	파라미터로 입력된 아이디값에 해당하는 테이블의 레코드를 읽어옴
	 	정보가 없으면 예외를 발생시키고, 있으면 해당 정보가 map(vo)으로 리턴됨
	 */
	
	@Override
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {

		System.out.println("로그인 체크까지는 오나요 ?");
		Map<String, Object> user = sqlSession.selectOne("spring.project.bookshop4.persistence.GuestDAO.selectUser", userid);
		System.out.println("로그인 체크 ==> " + userid);
		
		
		//인증 실패 시 인위적으로 예외를 발생시킴
		if(userid== null) throw new UsernameNotFoundException(userid);
		System.out.println("확인1");
		//ArrayList 먼저 import, GrandtedAuthority import
		List<GrantedAuthority> authority = new ArrayList<GrantedAuthority>();
		System.out.println("확인2");
		//오라클에서는 필드명을 대문자로 취급
		authority.add(new SimpleGrantedAuthority(user.get("AUTHORITY").toString()));
		System.out.println("확인3");
		//오라클에서는 BegInteger 관련 오류가 발생할 수 있으므로 아래와 같이 처리
		//사용자가 입력한 값과 테이블의 USERNAME(=userid), PASSWORD(아래)를 비교해서 
		//비밀번호가 일치하지 않으면 알아서 LoginFailure로 이동하고, 비밀번호가 일치하면 LoginSuccess로 이동
		//스프링 시큐리티에서 체크하는 아래 필드로 select시에 별칭을 줌
		//테이블의 암호화된 비밀번호와 사용자가 입력한 비밀번호를 내부적으로 비교처리
		return new UserVO(user.get("USERNAME").toString(),
						  user.get("PASSWORD").toString(),
						  (Integer)Integer.valueOf(user.get("ENABLED").toString()) == 1,
						  true, true, true, authority, user.get("USERNAME").toString());
	}
}
