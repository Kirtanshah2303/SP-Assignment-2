#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINE_LENGTH 256

struct Node
{
    char line[MAX_LINE_LENGTH];
    struct Node *next;
};

void insertLine(struct Node **tail, char *line)
{
    struct Node *newLine = (struct Node *)malloc(sizeof(struct Node));
    strncpy(newLine->line, line, MAX_LINE_LENGTH - 1);
    newLine->line[MAX_LINE_LENGTH - 1] = '\0';
    newLine->next = NULL;

    if (*tail == NULL)
    {
        *tail = newLine;
    }
    else
    {
        (*tail)->next = newLine;
        *tail = newLine;
    }
}
// Function to print the last n lines from the linked list
void printLastLines(struct Node *head, int n)
{
    struct Node *current = head;
    int numLines = 0;
    while (current != NULL)
    {
        numLines++;
        current = current->next;
    }
    int startPos = numLines - n;
    if (startPos < 0)
    {
        startPos = 0;
    }
    current = head;
    for (int i = 0; i < startPos; i++)
    {
        if (current == NULL)
        {
            break;
        }
        current = current->next;
    }
    while (current != NULL)
    {
        printf("%s", current->line);
        current = current->next;
    }
}

int main(int argc, char *argv[])
{
    int n = 10;
    if (argc > 1)
    {
        n = atoi(argv[1]);
    }

    struct Node *head = NULL;
    struct Node *tail = NULL;
    char line[MAX_LINE_LENGTH];

    while (fgets(line, MAX_LINE_LENGTH, stdin) != NULL)
    {
        insertLine(&tail, line);
        if (head == NULL)
        {
            head = tail;
        }
    }

    printf("Last %d lines are..\n", &n);
    printLastLines(head, n);
}
