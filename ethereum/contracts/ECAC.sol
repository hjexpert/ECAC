pragma solidity ^0.6.0;

 

contract ECAC_SmartContract {

    uint point;

 

    /* 단일 사용자에 대한 구조체 */

    struct User {

        int likes;

        int nestedComments;

        int likesCount;

        int nestedCommentsCount;

    }

 

    /* User 구조체를 저장하는 상태변수 */

    mapping(address => User) public users;

 

    

    /* 생성자 */

    constructor() public {

        point = 0;

    }

 

    /* Point 조회 */

    function getCount() public view returns(uint) {

        return point;

    }

 

    /* 좋아요에 따른 Point 부여 - 100개당 100p */

    function addPoint_likes(uint likes, uint likesCount) public {

        uint likesHundred = likes / 100;

 

        if (likesHundred > likesCount) {

        point = point + ((likesHundred-likesCount)*100);

        likesCount += (likesHundred-likesCount);

        }

    }

 

    /* 대댓글에 따른 Point 부여 - 20개당 100p */ 

    function addPoint_nestedComments(uint nestedComments, uint nestedCommentsCount) public {

        uint nestedCommentsHundred = nestedComments / 20;

  

        if (nestedCommentsHundred > nestedCommentsCount) {

 

        point = point + ((nestedCommentsHundred-nestedCommentsCount)*100);

        nestedCommentsCount += (nestedCommentsHundred-nestedCommentsCount);

        }

    }

 

    /* 사용자가 입력한 포인트 환급 */

    function refunds (uint input) public {

        point = point - input;

    }

}