import java.util.Arrays;

public class MoreSpicy {
    public int solution(int[] scoville, int K) {
        int mixCount = 0;
        Arrays.sort(scoville);

        while(scoville[0] < K) {
            /*
            System.out.print("while - ");
            for (int i : scoville) {
                System.out.print(i + " ");
            }
            System.out.println();
            */

            if(scoville.length < 2) { return -1;}
            int mixed = scoville[0] + (scoville[1] * 2);
            mixCount ++;
            int [] tempArray = new int[scoville.length - 1];
            System.arraycopy(scoville, 2, tempArray, 0, scoville.length - 2);

            int insertIndex = -1;

            for(int i = 0; i < tempArray.length - 1; i ++) {
                if (mixed < tempArray[i]) {
                    insertIndex = i;
                    break;
                }
            }

            if(insertIndex == -1) {
                tempArray[tempArray.length - 1] = mixed;
                scoville = tempArray.clone();
            } else if(insertIndex == 0){
                System.arraycopy(tempArray, 0, tempArray, 1, tempArray.length - 1);
                tempArray[0] = mixed;
                scoville = tempArray.clone();
            }  else {
                int [] temp2Array = new int[tempArray.length];
                System.arraycopy(tempArray, 0, temp2Array, 0, insertIndex);
                temp2Array[insertIndex] = mixed;
                System.arraycopy(
                    tempArray, insertIndex, // 소스
                    temp2Array, insertIndex + 1, // 도착지
                    (tempArray.length - 1) - insertIndex); // 개수
                scoville = temp2Array.clone();
            }
        }

        return mixCount;
    }
}
