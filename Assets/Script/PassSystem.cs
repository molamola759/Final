using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class PassSystem : MonoBehaviour
{
    public string nameTarget = "Player";
    public UnityEvent onPass;

    private void OnTriggerEnter2D(Collider2D collision)
    {
        if (collision.name == nameTarget) onPass.Invoke();
    }
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
