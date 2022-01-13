using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyBullet : MonoBehaviour
{
    public float dieTime, damage;
    public GameObject diePeffect;

    void Start()
    {
        StartCoroutine(CountDownTimer());
    }

    void OnTriggerEnter2D(Collider2D hitInfo)
    {
        Player enemy = hitInfo.GetComponent<Player>();
        enemy.TakeDamage(5);
        Destroy(gameObject);
    }

    IEnumerator CountDownTimer()
    {
        yield return new WaitForSeconds(dieTime);
        Destroy(gameObject);
    }
}
