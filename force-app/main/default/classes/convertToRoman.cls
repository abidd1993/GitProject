public with sharing class convertToRoman {
    public String convertToRomanMethod(Integer num) {
        String roman = '';
        Integer[] values = new Integer[]{1000,900,500,400,100,90,50,40,10,9,5,4,1};
        String[] numerals = new String[]{'M','CM','D','CD','C','XC','L','XL','X','IX','V','IV','I'};
        for (Integer i = 0; i < values.size(); i++) {
            while (num >= values[i]) {
                num -= values[i];
                roman += numerals[i];
            }
        }
        return roman;
    }

    public Integer convertToNumberMethod(String roman){
        // Integer num = 0;

        // String[] numerals = new String[]{'M','CM','D','CD','C','XC','L','XL','X','IX','V','IV','I'};
        // Integer[] values = new Integer[]{1000,900,500,400,100,90,50,40,10,9,5,4,1};

        Map<String, Integer> numMap = new Map<String, Integer>();
        numMap.put('M', 1000);
        numMap.put('D', 500);
        numMap.put('C', 100);
        numMap.put('L', 50);
        numMap.put('X', 10);
        numMap.put('V', 5);
        numMap.put('I', 1);

        List<String> splitRoman = new List<String>();
        splitRoman = roman.split('');
        
        System.debug(splitRoman);
        
        Integer len = splitRoman.size();

        Integer result = numMap.get(splitRoman[len-1]);

        for(Integer i = len - 2; i >= 0; i--){
            if(numMap.get(splitRoman[i]) >= numMap.get(splitRoman[i+1])){
                result += numMap.get(splitRoman[i]);
            }
            else {
                result -= numMap.get(splitRoman[i]);
            }
        }

        return result;
    }
}
