using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Weapon : MonoBehaviour
{
    public Transform firePoint;
    public GameObject bulletPrefab;
    public float    X = 0.22f;
    public float Y = 1f;
    private Vector3 pos;
    //public Enemy enemy;

    private void Start()
    {
        pos.y = Y;
    }
    private void Update()
    {
        
        if (Player.sr.flipX)
        {
            pos.x = -X;
        }
        if (Player.sr.flipX == false)
        {
            pos.x = X;
        }
        print(pos);
        if (Input.GetButtonDown("Fire1"))
        {
            Shoot(); 
        }
    }

    void Shoot()
    {
        
        GameObject bulletObject = Instantiate(bulletPrefab, firePoint.position + pos, firePoint.rotation);

       // if (gameObject.CompareTag("Enemy"))
        //{
           // if (Enemy != null)
           // {
                
           // }
       // }
    }
}
