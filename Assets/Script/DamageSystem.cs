using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Events;


/// <summary>
/// Being Hit System
/// </summary>
public class DamageSystem : MonoBehaviour
{
    [Header("HPBar")]
    //public Image imgHpBar;
    [Header("HP")]
    public float hp = 100;
    [Header("Animator")]
    public string parameterDead = "TriggerDeath";
    [Header("DeathScene")]
    public UnityEvent onDead;

    private float hpMax;
    private Animator ani;

    // Awake System: excute b4 it start
    private void Awake()
    {
        ani = GetComponent<Animator>();
        hpMax = hp;
    }

    ///<summary>
    ///get Hurt
    ///</summary>
    ///<parm name="damage">reciveDamage/parm>"
    public void Hurt(float damage)
    {
        hp -= damage;
        if (hp <= 0) Dead();
    }

    private void Dead()
    {
        ani.SetTrigger(parameterDead);
        onDead.Invoke();
    }
}
