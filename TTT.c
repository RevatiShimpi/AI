#include<stdio.h>
#include<stdlib.h>
#include<stdbool.h>

char board[9]={'0','1','2','3','4','5','6','7','8'};

bool checkwin(){
    if(board[0]==board[1] && board[1]==board[2]){
        return true;
    }
    else if(board[3]==board[4] && board[4]==board[5]){
        return true;
    }
    else if(board[6]==board[7] && board[7]==board[8]){
        return true;
    }
    else if(board[3]==board[0] && board[0]==board[6]){
        return true;
    }
    else if(board[1]==board[4] && board[4]==board[7]){
        return true;
    }
    else if(board[2]==board[5] && board[5]==board[8]){
        return true;
    }
    else if(board[0]==board[4] && board[4]==board[8]){
        return true;
    }
    else if(board[2]==board[4] && board[4]==board[6]){
        return true;
    }
    return false;
}

void set()
{
    printf("\n\n\tTic Tac Toe\n\n");

    printf("Player 1 (X)  -  Player 2 (O)\n\n\n");


    printf("     |     |     \n");
    printf("  %c  |  %c  |  %c \n", board[0], board[1], board[2]);

    printf("_____|_____|_____\n");


    printf("  %c  |  %c  |  %c \n", board[3], board[4], board[5]);

    printf("_____|_____|_____\n");


    printf("  %c  |  %c  |  %c \n", board[6], board[7], board[8]);

}

int play(int player,int turn){
    if(turn==9){
        return -1;
    }
    set();
    int choice;
    if(player%2==1){
        printf("\n enter choice player 1");
        scanf("%d",&choice);
        if(board[choice]=='X' || board[choice]=='O'){
            printf("\n Invalid choice");
        }
        board[choice]='X';
        if(checkwin()){
            return 1;
        }
    }
    else{
        printf("\n enter choice player 2");
        scanf("%d",&choice);
        if(board[choice]=='X' || board[choice]=='O'){
            printf("\n Invalid choice");
        }
        board[choice]='O';
        if(checkwin(board)){
            return 2;
        }
    }
    return play(player+1,turn+1);
    
}

int main(){
    int ans=play(1,1);
    if(ans==-1){
        printf("\n Draw");
    }
    else{
        printf("\n Winner player %d",ans);
    }
    
    return 0;
    
}

