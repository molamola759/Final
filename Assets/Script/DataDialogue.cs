using UnityEngine;

// Building porject menue(menuName)Floder/Subfloder
[CreateAssetMenu(menuName = "NPC/ConversationData")]
/// <summary>
/// ConversationData
/// Save NPC speak to Player Dialogue
/// </summary>
/// Scriptable Object : save data into Project OBJ
public class DataDialogue : ScriptableObject
{
    // Text Area (minimum rows & miximum rows) - only for string
    [Header("Conversation Data"), TextArea(3, 5)]
    public string[] dialogues;
}
