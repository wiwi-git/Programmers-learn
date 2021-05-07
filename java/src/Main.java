public class Main {
    public static void main(String[] args) {
        MoreSpicy ms = new MoreSpicy();
        int[] scoville = {1, 2, 3, 9, 10, 12};
        int result = ms.solution(scoville, 7);
        System.out.println(result);
    }
}