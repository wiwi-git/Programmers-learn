public class StockPrice {
    public int[] solution(int[] prices) {
        int[] answer = new int[prices.length];
        for(int i = 0 ; i < prices.length ; i++) {
            int sec = 0;
            for(int k = (i + 1) ; k < prices.length ; k++ ){
                sec++;
                if (prices[i] > prices[k]) { break; }
            }
            answer[i] = sec;
        }
        return answer;
    }
}
