using UnityEngine;

public class Loading : MonoBehaviour
{
    [Header("LoadingSystem")]
    public LoadingManager LoadingManager;
    [Header("Tricker LoadingSystem")]
    public string target = "Player";

    private void OnTriggerEnter2D(Collider2D collision)
    {
        if (collision.name == target)
        {
           
        }
    }
}
