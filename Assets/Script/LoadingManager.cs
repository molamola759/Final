using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class LoadingManager : MonoBehaviour
{
    
    public static LoadingManager Instance;

    public GameObject LoadingPanel;
    public float MinLoadTime;

    public GameObject LoadingWheel;
    public float WheelSpeed;

    public Image FadeImage;
    public float fadetime;
       
    private string targetScene;
    private bool isLoading;

    //private void OnTriggerEnter2D(Collider2D collision)
    //{
        //if (collision.name == target)
        //{
          //  print("Somebody tricker the trap!!!");
        //}
    //}

    private void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
            DontDestroyOnLoad(gameObject);
        }

        LoadingPanel.SetActive(false);
        FadeImage.gameObject.SetActive(false);
    }

    public void LoadScene(string sceneName)
    {
        targetScene = sceneName;
        StartCoroutine(LoadSceneRoutine());
        //SceneManager.LoadScene(sceneName);
    }

    private IEnumerator LoadSceneRoutine()
    {
        isLoading = true;

        FadeImage.gameObject.SetActive(true);
        FadeImage.canvasRenderer.SetAlpha(0);

        while (!Fade(1))
            yield return null;

        LoadingPanel.SetActive(true);
        StartCoroutine(SpinWheelRoutine());

        while (!Fade(0))
            yield return null;

        AsyncOperation op = SceneManager.LoadSceneAsync(targetScene);
        float elapsedLoadTime = 0f;

        while (!op.isDone)
        {
            elapsedLoadTime += Time.deltaTime;
            yield return null;
        }

        while (elapsedLoadTime < MinLoadTime)
        {
            elapsedLoadTime += Time.deltaTime;
            yield return null;
        }

        while (!Fade(1))
            yield return null;

        LoadingPanel.SetActive(false);


        while (!Fade(0))
            yield return null;

        isLoading = false;
    }

    private bool Fade(float target)
    {
        FadeImage.CrossFadeAlpha(target, fadetime, true);
        
        if (Mathf.Abs(FadeImage.canvasRenderer.GetAlpha() - target) <= 0.05f)
        {
            FadeImage.canvasRenderer.SetAlpha(target);
            return true;
        }
        return false;
    }

    private IEnumerator SpinWheelRoutine()
    {
        while (isLoading)
        {
            LoadingWheel.transform.Rotate(0, 0, -WheelSpeed);
            yield return null;
        }
    }
}
