pragma solidity ^0.4.19;

contract BubbleSort{

    //最简单的思路，只需要一个一个的比较，调换位置即可
    function sort(uint[] a,uint n) public {
        for(uint i = 0; i < n;i++){
            for (uint j = 0; j < n - i; j++) {
                if(a[j-1] > a[j]){
                    uint _temp;
                    _temp = a[j-1];
                    a[j-1] = a[j];
                    a[j] = _temp;
                }
            }
        }
    }

    //优化版本，设置标记为，排过序的跳过
    function sort2(uint[] _a,uint _n) public {
        uint j = _n;
        uint k = _n;
        
        bool _flag = true;

        while(_flag){
            _flag = false;
            for(j = 1;j < k;j++){
                for (j = 1;j < k;j++){
                    if(_a[j-1] > _a[j]){
                        uint temp;
                        temp = _a[j-1];
                        _a[j-1] = _a[j];
                        _a[j] = temp;

                        _flag = true;
                    }
                }

                k--;
            }
        }
    }

    //还是设置标记为，不断地缩小尾边界
    function sort3(uint[] _a,uint _n) public {
        uint _j;
        uint _k;

        uint _flag = _n;
        
        while(_flag > 0){//排序未结束
            _k = _flag;//k记录遍历尾边界
            _flag = 0;

            for(_j = 1;_j < _k;_j++){
                if(_a[_j-1]>_a[_j]){
                    //交换
                    uint _temp;
                    _temp = _a[_j-1];
                    _a[_j-1] = _a[_j];
                    _a[_j] = _temp;

                    _flag = _j;//记录新的尾边界
                }
            }
        }
    }
}