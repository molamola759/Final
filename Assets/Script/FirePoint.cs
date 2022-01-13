using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FirePoint : MonoBehaviour
{
    private float direction;

    private void Awake()
    {
        if (Player.sr.flipX)
        {
            direction = -1;
        }
        if (Player.sr.flipX == false)
        {
            direction = 1;
        }
    }
}
