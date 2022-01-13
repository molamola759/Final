using UnityEngine;
using System.Collections; // Quote System,Gather include Coeroutine

/// <summary>
/// Knowing The Coroutine
/// </summary>

public class LearnCoroutine : MonoBehaviour
{
    private void Start()
    {
        StartCoroutine(Test()); // Start the Coroutine
        StartCoroutine(TestWithLoop());
    }

    // Delimit The Coroutine
    // Sending back the IEnumerator
    private IEnumerator Test()
    {
        print("This is the first text messenge~");
        yield return new WaitForSeconds(1);
        print("This is the second text messenge~");
        yield return new WaitForSeconds(3);
        print("3sec later......");
    }

    private IEnumerator TestWithLoop()
    {
        for (int i = 0; i < 10; i++)
        {
            print("Number:" + i);
            yield return new WaitForSeconds(0.5f);
        }
    }
}
