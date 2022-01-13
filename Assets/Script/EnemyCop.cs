using System.Collections;
using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
public class EnemyCop : MonoBehaviour
{
    #region
    [Header("CheckTheChasingArea")]
    public Vector3 v3TrackSize = Vector3.one;
    public Vector3 v3Trackoffset;

    [Header("EnemyCopHP"), Range(0, 20)]
    public int EnemyCop_HP = 20;

    [Header("EnemyCopDamage"), Range(0, 10)]
    public int EnemyCop_ATK = 5;

    [Header("EnemyCopMoveSpeed"), Range(0, 5)]
    public int EnemyCop_MoveSpeed = 3;

    [Header("IsEnemyCopAttacking")]
    public bool EnemyCopIsAttacking = false;

    [Header("IsEnemyCopJumping")]
    public bool EnemyCopIsJumping = false;

    [Header("TargetLayer")]
    public LayerMask layerTarget;

    [Header("Animation")]
    public string parameterWalk = "Run";
    public string parameterAttack = "Attack";

    [Header("FacingTargetObj")]
    public Transform target;

    [Header("Attack Distance"), Range(0, 5)]
    public float attackDistance = 1.3f;

    [Header("AttackCD"), Range(0, 10)]
    public float attackCD = 2.8f;
    [Header("CheckTheAttackRegion&Movement")]
    public Vector3 v3AttackSize = Vector3.one;
    public Vector3 v3AttackOffset;
    public GameObject deathEffect;

    private float angle = 0;
    private Rigidbody2D rig;
    private Animator ani;
    private float timerAttack;
    #endregion

    #region
    private void Start()
    {
        rig = GetComponent<Rigidbody2D>();
        ani = GetComponent<Animator>();
    }

    private void OnDrawGizmos()
    {
        Gizmos.color = new Color(1, 0, 0, 0.3f);
        Gizmos.DrawCube(transform.position + transform.TransformDirection(v3Trackoffset), v3TrackSize);

        Gizmos.color = new Color(0, 1, 0, 0.3f);
        Gizmos.DrawCube(transform.position + transform.TransformDirection(v3AttackOffset), v3AttackSize);
    }
    #endregion

   // private void Update()
   // {
        //CheckTargetInArea();
   // }

    #region
    ///<summary>
    ///Check the target is in the area or not
    ///</summary>

    //private void CheckTargetInArea()
    //{
        // 2D physic.CoverBox(Central, Size, Angle)
        //Collider2D hit = Physics2D.OverlapBox(transform.position + transform.TransformDirection(v3Trackoffset), v3TrackSize, 0, layerTarget);

        //if (hit) print(hit.name);
        //if (hit) rig.velocity = new Vector2(-EnemyCop_MoveSpeed, rig.velocity.y);

        //if (hit) Move();
    //}
    #endregion

   // private void Move()
    //{
        //if target X < Enemy X means at the left angle 0
        //if target X > Enemy X means at the right angle 180

       // if (target.position.x > transform.position.x)
       // {
            //right angle = 180
       // }
       // else if (target.position.x < transform.position.x)
       // {
            //Left angle = 0
      //  }
        // ternary operator: bool? If bool is true : If bool is false;
      //  angle = target.position.x > transform.position.x ? 180 : 0;

       // transform.eulerAngles = Vector3.up * angle;
        //rig.velocity = new Vector2(-EnemyCop_MoveSpeed, rig.velocity.y);
      //  rig.velocity = transform.TransformDirection(new Vector2(-EnemyCop_MoveSpeed, rig.velocity.y));
      //  ani.SetBool(parameterWalk, true);

        // Distance = 3 dimensional vector.Distance(point A&point B)
      //  float distance = Vector3.Distance(target.position, transform.position);
        //print("Distance With the Target:" + distance);

       // if (distance <= attackDistance)  // If Distance <= Attack distance
       // {
       //     rig.velocity = Vector3.zero;  // stop
       //     Attack();
       // }
  //  }

   // [Header("Attack"), Range(0, 100)]
  //  public float attack = 35;

    ///<summary> Attack
   // private void Attack()
   // {
    //    if (timerAttack < attackCD)   //if timer < CD Time
   //     {
   //         timerAttack += Time.deltaTime;   // Accumulated Time Time.deltaTime 1fps time
   //     }
  ///      else 
   //     {
   //         ani.SetTrigger(parameterAttack);    // if Timer >= CDTime than Attack
   //         timerAttack = 0;                    // Time return 0
    //        Collider2D hit = Physics2D.OverlapBox(transform.position + transform.TransformDirection(v3AttackOffset), v3AttackSize, 0, layerTarget);
            //print("Somth got Hit:" + hit.name);
    //        hit.GetComponent<DamageSystem>().Hurt(attack);
    //    }
  //  }

    public void TakeDamage (int damage)
    {
        EnemyCop_HP -= damage;

        if (EnemyCop_HP <= 0)
        {
            Die();
        }    
    }

    void Die()
    {
        Instantiate(deathEffect, transform.position, Quaternion.identity);
        Destroy(gameObject);
    }

}