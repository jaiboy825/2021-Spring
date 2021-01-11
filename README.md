# 2021-Spring
21년도 스프링 수업
MVC 구조
Spring 폴더 아래에 stsbundle, 그 아래에 STS.exe

#### 서블릿 - out.println("html"); - cgi 기법

- html 문서에 java를 올려놓고 <% String userid = ""; %> jsp
- html 문서에 c를 올려놓고 php
- html 문서에 비주얼베이지 올려놓고 asp
- 번역해서 html 문서를 만든다. (톰캣이 필요함)

##### jsp 만 가지고 개발을 하면 - model1(java,html,css,javascript) 가 한 파일에

- 웹서버가 자꾸 커지니까 jsp만 가지고 작업이 힘들다
- 디자인에 치중하다보니까 디자인 바꾸려면 다 바꿔야 한다.

##### Model - DB에 데이터 읽고 쓰기, java, servlet
##### View - java + html, css, javascript
##### Controller - 중간에서 가교역할 (모델과 뷰를 연결하는 역할 ), 서블릿

- 프레임워크 - 앞으로 무조건 MVC 개발을 하도록 하자

## 1. DI와 AOP 개념
### DI(Dependency Injection) - 의존성 주입, IoC(제어 역행)
``` java
class Message{
   Message m = new Message(); // 내가 직접 객체 생성
   m.hello
}
```
계속적으로 객체가 생성되면 메모리가 부족해지면서 자바 가상머신안에 있는 개비지 콜렉터가    
메모리 수집을 한다. -> 어느 시점에 발생할 지 모른다.     
클래스 중에 데이터 저장용이 아닌 클래스들, 일을 하는 클래스들을 필요할 때마다 이걸 생성했다가 없앴다 해야할까 ?      
(동네 택배)    
일을 하는 클래스들은 객체 하나 만들어서 서버 내릴때까지 쓰자     
객체를 만들어서 관리할 누군가가 필요하다. - 스프링      

스프링 프레임워크는 객체 관리를 프레임워크가 한다.     
원리는 인터페이스를 이용해서 객체간의 관계를 약하게 해서 (결합 약하게) 객체를 프레임워크가 만들어서 내가 클래한테 전달하는 구조     

``` java
class Hello {
  Message m; // 스프링이 객체를 만들어서 넣어준다. 
  //1.xml 파일을 가지고 (스프링 처음부터)
  //2. 어노테이션(@) - 자바 5.0부터 이 개념이 추가된다.
}
```
### AOP (Aspect Orientation Programming)
공통의 관심사가 있다. 로긴, 로그, 트랙잭션 처링 등을 별도의 요소로 뽑아내서     
프로그램을 횡단해서 중간 중간 끼워넣기를 한다.

``` java
@Transactional
void insert() 
{
  // 데이터 베이스 읽고 쓰기
}
```
팀장 혼자서 프로그램하고 다른 개발자들이 만들어놓은 소스에 끼워넣기

자바파일들을 한번에 번역해주고 + 알파 지원해주는 유틸
maven     
gradle     

maven 파일업로드 - cos.jar, ojdbc14.jar odbc6.jar     
이전에는 개발자가 인터넷 사이트가서 하나씩 다운받아 설치작업을 했는데     
너무 힘들다. maven 에서 repository 라는 사이트를 만들어서      
필요한 라이브러리를 repository 라는곳에 모아놓고    
필요할때 다운받아 쓸 수 있게 만들어놨음       
다운이 필요한 라이브러리 정보를 xml 파일에 기술하면 다운받아준다.   
pom.xml 파일이 있다.     

1. pom.xml 파일부터    
[https://mvnrepository.com/](https://mvnrepository.com/)
run ass - maven install
하면다 다운받아준다

src -프로그램을 한다  
- main : 여기가 작업하는 공간
- java : 자바 소스 놓는곳
- resources : 각종 설정파일들, xml 파일들
- web : jsp 파일 두는곳, js, html, css
- WEB-INF > views > jsp파일들
- test  
target - 번역된 프로그램이 저장되는 공간

2. web.xml 파일의 역할
``` 
<?xml version="1.0" encoding="UTF-8"?>
<web-app version="2.5" xmlns="http://java.sun.com/xml/ns/javaee"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://java.sun.com/xml/ns/javaee https://java.sun.com/xml/ns/javaee/web-app_2_5.xsd">

	<!-- The definition of the Root Spring Container shared by all Servlets and Filters -->
	<context-param>
		<param-name>contextConfigLocation</param-name>
		<param-value>/WEB-INF/spring/root-context.xml</param-value>
	</context-param>
	
	<!-- Creates the Spring Container shared by all Servlets and Filters -->
	<listener>
		<listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
	</listener>
   
	<!-- Processes application requests -->
	<servlet>
		<servlet-name>appServlet</servlet-name>
		<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
		<init-param>
			<param-name>contextConfigLocation</param-name>
			<param-value>/WEB-INF/spring/appServlet/servlet-context.xml</param-value>
		</init-param>
		<load-on-startup>1</load-on-startup>
	</servlet>
		
	<servlet-mapping>
		<servlet-name>appServlet</servlet-name>
		<url-pattern>/</url-pattern>
	</servlet-mapping>

</web-app>
```
- 스프링은 DispatcherServlet 이 서블릿 클래스로부터 모든 요청을 처리한다.
- DispatcherServlet 한테 지시를 할 수 있다.
- 지시는 xml 파일에다가 정해진 형식으로 servlet-context.xml 파일안에 내가 원하는걸 기술해주면 된다
 
### 작업순서
1. Dto(vo), Data Transfer Object 클래스를 만든다 - 데이터 저장용 디비에 필드명
2. Dao (Data Access Object) - 모델단, 디비에 데이터 읽고 쓰기
	인터페이스와 클래스
3. Service - 모델단(트랜잭션 처리)
	인터페이스와 클래스
4. Controller
5. jsp 만든다

#### board
1. BoardDto
2. BoardDao - 인터페이스     
BoardDaoImpl - 인터페이스 상속받아 구현한 클래스, 일을 한다
3. BoardService     
BoardServiceImpl
4. BoardController

##### 설명
스프링 서버가 올라갈떄 @Controller, @Service, @Repository가 써있는 모든 클래스를 찾아서 객체를 만든다 (하나만 만들어서 돌려쓴다)      
싱글톤으로 만들어져요     
각 객체간에 @Resource 를 찾아서 서로 연결작업을 한다 (DI, 의존성 주입)     
@RequestMapping 을 찾아서 url과 연결된 컨트롤러 정보를 모두 프레임워크 안에 저장해 놓는다.    
그래서 클래스가 서로 달라도 @RequestMapping(value="url") 쓸 때 url이 충돌나면 안된다.    
##### 브라우저 -> 서버로 요청을 한다 
DispatchServlet 가 받아서 처리한다. (web.xml 파일에 기술되어 있다)      
해당 url이 어떤 컨트롤러와 연결해야 하는지 찾아서 컨트롤러 객체한테 모든 정보를 전달한다.      
컨트롤러 -> 서비스 (일을 맡긴다) -> Dao 한테 데이터를 DB에 넣거나 DB에서 가져오거나 작업을 진행      
컨트롤러 -> 서비스 DAO -> 서비스 ->      
컨트롤러는 가져온 저보를 view(jsp)페이지한테 전달한다. (Model을 통해서 전달한다)
##### DB 커넥션 풀 -> DB가 연결 -> 읽기 또는 쓰기 -> 연결을 끊는다
데이터 읽고 쓰기 보다 연결과 연결 끊기가 좀 더 시간이 오래 걸린다.      
미리 DB연결을 많이 만들어놓는다     <- 이걸 돌려쓰기 한다.

##### 계정만들기 
1. conn system/1234
2. create user user01 identified by 1234;
3. grant connect, resource to user01;
4. conn user01/1234;
#### sql
``` sql
create table board( id number primary key , title varchar2(30), writer varchar2(30), wdate date, contents varchar(100));
insert into board values (1, '제목1', '작성자1', sysdate, '내용1');
insert into board values (2, '제목2', '작성자2', sysdate, '내용2');
insert into board values (3, '제목3', '작성자3', sysdate, '내용3');
insert into board values (4, '제목4', '작성자4', sysdate, '내용4');
insert into board values (5, '제목5', '작성자5', sysdate, '내용5');
insert into board values (11, '제목1', '작성자1', sysdate, '내용1');
insert into board values (12, '제목2', '작성자2', sysdate, '내용2');
insert into board values (13, '제목3', '작성자3', sysdate, '내용3');
insert into board values (14, '제목4', '작성자4', sysdate, '내용4');
insert into board values (15, '제목5', '작성자5', sysdate, '내용5');
insert into board values (16, '제목1', '작성자1', sysdate, '내용1');
insert into board values (17, '제목2', '작성자2', sysdate, '내용2');
insert into board values (18, '제목3', '작성자3', sysdate, '내용3');
insert into board values (19, '제목4', '작성자4', sysdate, '내용4');
insert into board values (20, '제목5', '작성자5', sysdate, '내용5');
commit;
```

``` sql
create table freeboard 
(
    id number(11) primary key, 
    title varchar2(300), 
    writer varchar2(40),
    hit number,
    wdate date,
    delyn char(1),
    contents clob
);


insert into freeboard (id, title, wdate)
values(1, '제목1',  sysdate);

-- row_number() 라는 분석함수를 이용해서 페이징을 해보자
select id, title , row_number() over(order by id desc) as num from freeboard;
select id, title , row_number() over(order by id desc) as num, row_number() over(order by id desc) / 3 from freeboard;

1 2 3 - 1 몫 1
4 5 6 - 2
7 8 9 - 3

ceil - 무조건 올림 0.1,0.2,0.9 ---> 1
```
