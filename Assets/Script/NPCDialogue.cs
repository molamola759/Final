using UnityEngine;

/// <summary>
/// NPC Activity
/// Detect target into the Colli Zone
/// Show Dialogue�@Systems
/// </summary>

public class NPCDialogue : MonoBehaviour
{
    [Header("Dialouge Data")]
    public DataDialogue dataDialogue;
    [Header("Dialogue System")]
    public DialougeSystems dialogueSystem;
    [Header("Tricker Dialogue Character")]
    public string target = "Player";

    // Tricker Activity
    // 1.Two OBJ must have Collider 2D
    // 2.At least one must have rigidbody 2D
    // 3.At least one must have Is Trigger
    private void OnTriggerEnter2D(Collider2D collision)
    {
        if (collision.name == target)
        {
            dialogueSystem.StartDialogue(dataDialogue.dialogues);
            //print(collision.name);
            //print("Somebody tricker the trap!!!");
        }
    }

    private void OnTriggerExit2D(Collider2D collision)
    {
        if (collision.name == target)
        {
            dialogueSystem.StopDialogue();
        }
    }
}
