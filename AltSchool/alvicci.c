#include <stdio.h>
int main(void)
{
    int i, j, nbWords;
    int largest = 0;
    char word[100];
    
    scanf("%d", &nbWords);
    for(i = 0; i < nbWords; i++)
    {
        scanf("%s", word);
        j = 0;
        while(word[j] != '\0')
        {
            j++;
        }
        if(j > largest)
            largest = j;
    }
    printf("%d", largest);
    
    return (0);
}