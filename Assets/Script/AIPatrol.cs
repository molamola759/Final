using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AIPatrol : MonoBehaviour
{
    public float Walkspeed, range, timeBTWShots, shootSpeed;
    private float distToPlayer;

    [HideInInspector]
    public bool mustPatrol;
    private bool mustTurn, canshoot;

    public Rigidbody2D rb;
    public Transform groundCheckPos;
    public LayerMask Ladder;
    public LayerMask Platform;
    public Collider2D bodycollider;
    public Transform player, shootPos;
    public GameObject bullet;
    private Animator animator;

    private void Start()
    {
        mustPatrol = true;
        canshoot = true;
    }

    private void Update()
    {
        if (mustPatrol)
        {
            Patrol();
            
        }
        distToPlayer = Vector2.Distance(transform.position, player.position);

        if (distToPlayer <= range)
        {
            if (player.position.x > transform.position.x && transform.localScale.x < 0 ||
                player.position.x < transform.position.x && transform.localScale.x > 0)
            {
                Flip();
            }
            mustPatrol = false;
            rb.velocity = Vector2.zero;

            if(canshoot)
            StartCoroutine(Shoot());
           
        }
        else
        {
            mustPatrol = true;
        }
    }

    private void FixedUpdate()
    {
        if (mustPatrol)
        {
            mustTurn = !Physics2D.OverlapCircle(groundCheckPos.position, 0.1f, Platform);
        }
    }

    void Patrol()
    {
        if (mustTurn || bodycollider.IsTouchingLayers(Ladder))
        {
            Flip();
        }
        rb.velocity = new Vector2(Walkspeed * Time.fixedDeltaTime, rb.velocity.y);

    }

    void Flip()
    {
        mustPatrol = false;
        transform.localScale = new Vector2(transform.localScale.x * -1, transform.localScale.y);
        Walkspeed *= -1;
        mustPatrol = true;
    }

    IEnumerator Shoot()
    {
        canshoot = false;

        yield return new WaitForSeconds(timeBTWShots);
        GameObject newBullet = Instantiate(bullet, shootPos.position, Quaternion.identity);

        newBullet.GetComponent<Rigidbody2D>().velocity = new Vector2(shootSpeed * Walkspeed * Time.fixedDeltaTime, 0f);
        canshoot = true;
    }
        
}
