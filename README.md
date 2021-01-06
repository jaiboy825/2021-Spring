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
```
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

```
class Hello {
  Message m; // 스프링이 객체를 만들어서 넣어준다. 
  //1.xml 파일을 가지고 (스프링 처음부터)
  //2. 어노테이션(@) - 자바 5.0부터 이 개념이 추가된다.
}
```
### AOP (Aspect Orientation Programming)
공통의 관심사가 있다. 로긴, 로그, 트랙잭션 처링 등을 별도의 요소로 뽑아내서     
프로그램을 횡단해서 중간 중간 끼워넣기를 한다.

```
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
