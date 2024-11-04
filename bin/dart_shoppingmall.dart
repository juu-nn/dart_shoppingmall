import 'dart:io';

class Product {
    String name;
    int price;
    
    Product(this.name, this.price);
}



class ShoppingMall{
    List<Product> products = [
        Product('셔츠', 45000),
        Product('원피스', 30000),
        Product('반팔티', 35000),
        Product('반바지', 38000),
        Product('양말', 5000),
    ];
    int total = 0; 

    void showProducts() {
        for (final product in products) {
            print('${product.name} / ${product.price}원');
        }
    }

    void addToCart() {
        print('상품 이름을 입력해주세요 !');
        String? name = stdin.readLineSync();
        print('상품 개수를 입력해 주세요 !');
        String inputCount = stdin.readLineSync() ?? ""; // ?? - 앞에있는게 null일 때 뒤에 있는 것으로 바꿔달라는 것
        try {
            Product product = products.firstWhere((product) => product.name == name);
            int count = int.parse(inputCount);
            if (count > 0) {
                
                // => total == 장바구니의 총 가격임
                total += (product.price * count); // total = total + (product.price * count)와 같은 의미
                print('장바구니에 상품이 담겼어요 !');
            } else {
                print('0개보다 많은 개수의 상품만 담을 수 있어요 !');
            } 

        
        }

              catch (error) {
                // try에서 실패할 경우
                print('입력값이 올바르지 않아요 !');
            }

       
    }

     void showTotal() {
            print('장바구니에 $total원 어치를 담으셨네요 !');
        }

}





void main() {
 ShoppingMall shoppingmall = ShoppingMall();
 bool isTerminated = false;
 while (!isTerminated) {
    // menu
    print(
        '--------------------------------------------------------------------------------------------------');
    print(
        '[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료');
    print(
        '--------------------------------------------------------------------------------------------------');

    // std ==> standard / in ==> input (라이브러리)
    String? input = stdin.readLineSync();

    switch(input) {
        case '1':
        // 1 입력했을 때 할 동작 ...
         shoppingmall.showProducts();

        case '2':
        // 2 입력했을 때 할 동작 ...
         shoppingmall.addToCart();

        case '3':
        // 3 입력했을 때 할 동작...
         shoppingmall.showTotal();

        case '4':
        // 4 입력했을 때 할 동작...
         print('이용해 주셔서 감사합니다 ~ 안녕히 가세요 !');

        default:
         print('지원하지 않는 기능입니다 ! 다시 시도해 주세요 . . .');
    }
 }

 // 프로그램 종료 ...
}