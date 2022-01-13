using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Bullet : MonoBehaviour
{
    public float speed = 20f;
    public Rigidbody2D rb;
    public int damage = 10;

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

    void Start()
    {
        rb.velocity = transform.right * direction * speed;
    }

    void OnTriggerEnter2D(Collider2D hitInfo)
    {
        EnemyCop enemy = hitInfo.GetComponent<EnemyCop>();
        if (enemy != null)
        {
            enemy.TakeDamage(damage);
        }
        Destroy(gameObject);
    }


}
