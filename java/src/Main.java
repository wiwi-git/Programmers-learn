public class Main {
    public static void main(String[] args) {
        int[] prices = new int[]{1, 2, 3, 2, 3};
        StockPrice stockPrice = new StockPrice();
        int[] result = stockPrice.solution(prices);
        for (int i : result) {
            System.out.print(i + " ");
        }
    }
}