package SelfStudy;

public class membercall {
   int iv = 10;
   static int cv = 20;
   
   int iv2 =  cv;
   // static int cv2 = iv; // 에러 : 클래스 변수는 인스턴스 변수를 사용할 수 없다.
   static int cv2 = new membercall().iv; // 이와 같이 객체를 생성해야 사용이 가능하다.
   
   static void staticMethod1() {
      System.out.println(cv);
      //System.out.println(iv); //에러. 클래스메소드에서 인스턴스 변수를 사용 불가 
      membercall c = new membercall();
      System.out.println(c.iv); // 객체를 생성한 후, 인스턴스 변수의 참조가 가능
   }
   
   void instanceMethod1() {
      System.out.println(cv);
      System.out.println(iv);
   }
   
   static void staticMethod2() {
      staticMethod1();
//      instanceMethod1(); // 에러. 클래스 메소드에서는 인스턴스 메소드를 호출할 수 없다.
      membercall c = new membercall();
      c.instanceMethod1(); // 인스턴스를 생성한 후에야 호출 가능하다.
   }
   
   void instanceMethod2() {
      staticMethod1();
      instanceMethod1();
      // 인스턴스메소드에서는 인스턴스 메소드와 클래스 메소드 모두 인스턴스 생성없이 바로 호출이 가능하다
      
   }
   
}