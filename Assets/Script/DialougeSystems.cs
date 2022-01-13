using UnityEngine;
using UnityEngine.UI;
using System.Collections;

/// <summary>
/// DialougeSystems
/// Using the TypeEffect to output the Dialouge
/// </summary>

public class DialougeSystems : MonoBehaviour
{
    [Header("Converstion interval"), Range(0, 1)]
    public float interval = 500f;
    [Header("Canvas Conversation Systems")]
    public GameObject goDialogue;
    [Header("Text Content")]
    public Text textContent;
    [Header("Converstion End Image")]
    public GameObject goTip;
    [Header("Converstion Key")]
    public KeyCode keyDialogue = KeyCode.Mouse0;

    private void Start()
    {
        //StartCoroutine(TypeEffect());
    }

    private IEnumerator TypeEffect(string[] contents)
    {
        //Change Code hotkey Ctrl + R + R
        //Test only
        //string test1 = "It's a me Mario~ ";
        //string test2 = "What? Don't u reconize me?";

        //string[] contents = { test1, test2 };

        //textContent.text = "";   //Clean pervious Dialouge
        
        goDialogue.SetActive(true); // Show Dialogue Obj

        for (int j = 0; j < contents.Length; j++) // search all Dialogue
        {
            textContent.text = ""; // clean last Converstion
            goTip.SetActive(false); // Hide the image Knife

            for (int i = 0; i < contents[j].Length; i++) //search every word in the Dialogue
            {
                textContent.text += contents[j][i]; //Superimpose Text Content UI
                                             //print(test[i]);
                yield return new WaitForSeconds(interval);
            }

            goTip.SetActive(true);  // show End Dialogue Image-Knife

            while (!Input.GetKeyDown(keyDialogue)) //if Player did not press continue than keep going
            {
                yield return null;  //wait null one frame time
            }

        }

        goDialogue.SetActive(false);  // Hide Dialogue
    }

    /// <summary>
    /// Start Converstion
    /// </summary>
    /// <param name="contents">Show the typing effect of the Dialogue</param>

    public void StartDialogue(string[] contents)
    {
        StartCoroutine(TypeEffect(contents));
    }

    /// <summary>
    /// Stop Converstion
    /// </summary>
    
    public void StopDialogue()
    {
        StopAllCoroutines();         //Stop Coroutine
        goDialogue.SetActive(false);  //Hide Converstion HUD
    }



}
