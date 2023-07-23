#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINE_LENGTH 256

// Define the node structure for the linked list
struct Node
{
    char line[MAX_LINE_LENGTH];
    struct Node *next;
};

// Function to insert a new line at the end of the linked list
void insertLine(struct Node **tail, char *line)
{
    struct Node *newLine = (struct Node *)malloc(sizeof(struct Node));
    if (newLine == NULL)
    {
        fprintf(stderr, "Memory allocation error.\n");
        exit(EXIT_FAILURE);
    }

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

// Function to free the linked list
void freeList(struct Node *head)
{
    struct Node *current = head;
    while (current != NULL)
    {
        struct Node *next = current->next;
        free(current);
        current = next;
    }
}

// Function to print the last n lines from the linked list
void printLastLines(struct Node *head, int n)
{
    struct Node *current = head;
    int numLines = 0;

    // Count the number of lines in the linked list
    while (current != NULL)
    {
        numLines++;
        current = current->next;
    }

    // Calculate the starting position to print the last n lines
    int startPos = numLines - n;
    if (startPos < 0)
    {
        startPos = 0;
    }

    // Traverse to the starting position
    current = head;
    for (int i = 0; i < startPos; i++)
    {
        if (current == NULL)
        {
            break;
        }
        current = current->next;
    }

    // Print the last n lines
    while (current != NULL)
    {
        printf("%s", current->line);
        current = current->next;
    }
}

int main(int argc, char *argv[])
{
    int n = 10; // Default number of lines to print
    if (argc > 1)
    {
        n = atoi(argv[1]);
    }

    struct Node *head = NULL;
    struct Node *tail = NULL;
    char line[MAX_LINE_LENGTH];

    // Read input lines and store them in the linked list
    while (fgets(line, MAX_LINE_LENGTH, stdin) != NULL)
    {
        insertLine(&tail, line);
        if (head == NULL)
        {
            head = tail;
        }
    }

    // Print the last n lines
    printLastLines(head, n);

    // Free the linked list memory
    freeList(head);

    return 0;
}
