using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BossSamurai : MonoBehaviour
{
    [Header("BossSamuraiHP"), Range(0, 1000)]
    public int BossSamurai_HP = 500;

    [Header("BossSamuraiDamage"), Range(0, 10)]
    public int BossSamurai_ATK = 50;

    [Header("BossSamuraiMoveSpeed"), Range(0, 10)]
    public int BossSamurai_MoveSpeed = 5;

    [Header("IsBossSamuraiAttacking")]
    public bool BossSamuraiIsAttacking = false;

    [Header("IsBossSamuraiJumping")]
    public bool BossSamuraiIsJumping = false;

    public GameObject deathEffect;
    public bool isInvulnerable = false;

    public Transform player;

    public bool isFlipped = false;

    public void LookAtPlayer()
    {
        
    }

    public void TakeDamage(int damage)
    {
        if (isInvulnerable)
            return;

        BossSamurai_HP -= damage;

        if (BossSamurai_HP <= 0)
        {
            Die();
        }

        void Die()
        {
            Instantiate(deathEffect, transform.position, Quaternion.identity);
            Destroy(gameObject);
        }
    }



}
