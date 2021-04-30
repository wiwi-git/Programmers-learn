public class Main {
    public static void main(String[] args) {
        int n1 = 5;
        int n2 = 4;
        int[] n1Stages = {2, 1, 2, 6, 2, 4, 3, 3};
        int[] n2Stages = {4,4,4,4,4};

        FailureRate failureRate = new FailureRate();
        //solution(int N, int[] stages)
        int[] result1 = failureRate.solution(n1, n1Stages);
        int[] result2 = failureRate.solution(n2, n2Stages);

        for (int i : result1) {
            System.out.print(i + " ");
        }
        System.out.println();
        for (int i : result2) {
            System.out.print(i + " ");
        }
        System.out.println();
    }
}