<div align="center">

[
    <img src="./PhotonX-extended.png" width="750">
](#---)

#       `PhotonX` in Julia

A Computational Toolkit for design and simulation of photonic devices

[Carlos Antunis Bonfim da Silva Santos](https://github.com/carlos-antunis-physics/)

[![Julia programming language](https://img.shields.io/badge/Julia-efefef.svg?logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMjggMTI4Ij48cGF0aCBkPSJNNTguMyA5My41YzAgMTUuNy0xMi43IDI4LjMtMjguMyAyOC4zLTE1LjcgMC0yOC4zLTEyLjctMjguMy0yOC4zIDAtMTUuNiAxMi43LTI4LjMgMjguMy0yOC4zIDE1LjYtLjEgMjguMyAxMi42IDI4LjMgMjguMyIgZmlsbD0iI2NiM2MzMyIvPjxwYXRoIGQ9Ik0zMCAxMjMuNGMtMTYuNSAwLTMwLTEzLjQtMzAtMzBzMTMuNC0zMCAzMC0zMCAzMCAxMy40IDMwIDMwLTEzLjUgMzAtMzAgMzB6bTAtNTYuNmMtMTQuNyAwLTI2LjcgMTItMjYuNyAyNi43czEyIDI2LjcgMjYuNyAyNi43IDI2LjctMTIgMjYuNy0yNi43LTEyLTI2LjctMjYuNy0yNi43eiIgZmlsbD0iI2VlZSIvPjxwYXRoIGQ9Ik0xMjYuNCA5My41YzAgMTUuNy0xMi43IDI4LjMtMjguMyAyOC4zcy0yOC4zLTEyLjctMjguMy0yOC4zYzAtMTUuNiAxMi43LTI4LjMgMjguMy0yOC4zczI4LjMgMTIuNiAyOC4zIDI4LjMiIGZpbGw9IiM5NTU4YjIiLz48cGF0aCBkPSJNOTggMTIzLjRjLTE2LjUgMC0zMC0xMy40LTMwLTMwczEzLjQtMzAgMzAtMzAgMzAgMTMuNCAzMCAzMC0xMy40IDMwLTMwIDMwem0wLTU2LjZjLTE0LjcgMC0yNi43IDEyLTI2LjcgMjYuN3MxMiAyNi43IDI2LjcgMjYuNyAyNi43LTEyIDI2LjctMjYuN1MxMTIuOCA2Ni44IDk4IDY2Ljh6IiBmaWxsPSIjZWVlIi8+PHBhdGggZD0iTTkyLjQgMzQuNWMwIDE1LjYtMTIuNyAyOC4zLTI4LjMgMjguMy0xNS43IDAtMjguMy0xMi43LTI4LjMtMjguM1M0OC40IDYuMiA2NCA2LjJjMTUuNyAwIDI4LjQgMTIuNyAyOC40IDI4LjMiIGZpbGw9IiMzODk4MjYiLz48cGF0aCBkPSJNNjQgNjQuNWMtMTYuNSAwLTMwLTEzLjQtMzAtMzBzMTMuNC0zMCAzMC0zMCAzMCAxMy40IDMwIDMwLTEzLjUgMzAtMzAgMzB6bTAtNTYuN2MtMTQuNyAwLTI2LjcgMTItMjYuNyAyNi43czEyIDI2LjcgMjYuNyAyNi43IDI2LjctMTIgMjYuNy0yNi43Uzc4LjcgNy44IDY0IDcuOHoiIGZpbGw9IiNlZWUiLz48L3N2Zz4=&style=flat-square)](#---)
[![C programming language](https://img.shields.io/badge/C-efefef.svg?logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMjggMTI4Ij48cGF0aCBmaWxsPSIjMDM1OTlDIiBkPSJNMTE3LjUgMzMuNWwuMy0uMmMtLjYtMS4xLTEuNS0yLjEtMi40LTIuNkw2Ny4xIDIuOWMtLjgtLjUtMS45LS43LTMuMS0uNy0xLjIgMC0yLjMuMy0zLjEuN2wtNDggMjcuOWMtMS43IDEtMi45IDMuNS0yLjkgNS40djU1LjdjMCAxLjEuMiAyLjMuOSAzLjRsLS4yLjFjLjUuOCAxLjIgMS41IDEuOSAxLjlsNDguMiAyNy45Yy44LjUgMS45LjcgMy4xLjcgMS4yIDAgMi4zLS4zIDMuMS0uN2w0OC0yNy45YzEuNy0xIDIuOS0zLjUgMi45LTUuNFYzNi4xYy4xLS44IDAtMS43LS40LTIuNnpNNjQgODguNWM5LjEgMCAxNy4xLTUgMjEuMy0xMi40bDEyLjkgNy42Yy02LjggMTEuOC0xOS42IDE5LjgtMzQuMiAxOS44LTIxLjggMC0zOS41LTE3LjctMzkuNS0zOS41UzQyLjIgMjQuNSA2NCAyNC41YzE0LjcgMCAyNy41IDguMSAzNC4zIDIwbC0xMyA3LjVDODEuMSA0NC41IDczLjEgMzkuNSA2NCAzOS41Yy0xMy41IDAtMjQuNSAxMS0yNC41IDI0LjVzMTEgMjQuNSAyNC41IDI0LjV6Ii8+PC9zdmc+&style=flat-square)](#---)
[![Fortran programming language](https://img.shields.io/badge/Fortran-efefef.svg?logo=data:image/svg%2bxml;base64,PHN2ZyB3aWR0aD0iMTI4IiBoZWlnaHQ9IjEyOCIgdmlld0JveD0iMCAwIDEyOCAxMjgiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiAgPHBhdGggc3R5bGU9ImZpbGw6IzczNGM5NDtmaWxsLW9wYWNpdHk6MTtmaWxsLXJ1bGU6bm9uemVybztzdHJva2U6bm9uZSIgZD0iTTE4Ljk2OSAwQzEzLjI1IDAgMCAxMSAwIDE4LjY2djkwLjQ1M2MwIDUuNjkyIDExLjIxIDE4LjkwMyAxOC43ODEgMTguOTAzbDkwLjU1MS0uMDMyYzYuNzM4LS4wMDQgMTguNjg4LTkuNjgzIDE4LjY4OC0xOC42MDFWMTguODRjMC02LjA3OC0xMC42MS0xOC44MzItMTguNDMtMTguODMyTDE4Ljk2OSAwem0tMS4zOTUgMTMuNjZoOTMuMzY3djQxLjcxMWwtMTAuOTkyLS4xNjRjLS4xMDEtLjA5OC0uNDAyLTMuMDQ3LS42MDUtNS43NThDOTguMTkgMzYuNyA5NS4zMjggMjkuMzYzIDg5LjgwOSAyNi41Yy0yLjkxNC0xLjUwNC03LjQ1Ny0xLjk1LTIyLjAyLTEuOTUzbC0xMy41Ny4wMDR2MzEuMjczaDIuNDFjNC4wNjYtLjA1IDkuMjM0LTEuMDA0IDEwLjk0MS0yLjA1OCAyLjIxMS0xLjM1NiA0LjA2Ny01LjI3IDQuNzItOS45ODkuNDkxLTMuNDQ1Ljg3LTYuMDIzLjg3LTYuMDIzaDEwLjY3NnY0OS42OTFINzIuNzkzdi0xLjk1N2MwLTMuMjEtMS41MDgtMTAuNjkxLTIuNTYzLTEyLjk0OS0xLjY1Ni0zLjQ2NS00LjQ2NC00LjY2OC0xMi40NDktNS40MjJsLTMuNjY0LS4zNTEuMjAzIDE2LjExM2MuMTQ5IDE1LjMwOC4yNSAxNi4xNjQgMS4yMDMgMTcuNDY5IDEuMjA3IDEuNjA1IDIuNTEyIDEuOTA2IDEwLjQ5MyAyLjUwN2w1LjM1NS4yNTgtLjAzNSAxMC45MzhIMTcuNTc0di0xMC45NDJsNC45MjItLjMwNGM5Ljk4OC0uNjUzIDkuODg3LS42MDIgMTAuMzktOC40My40NS03LjQzLS4xMTYtNjUuNTk4LS40NTItNjYuNzYyLS41NTEtMS45MjItMi42MTgtMy4wMjctOC43ODYtMy4wMjNsLTYuMDc0LS4wNFYxMy42NnoiLz4KPC9zdmc+Cg==&style=flat-square)](#---)
[![Symbolics:6.43.0](https://img.shields.io/badge/Symbolics-6.43.0-676767.svg?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAETklEQVR4AWIYsgDAe1kAt60EYbjMzIyWy2CrL8bHzPwkP2ZmKjMzKVKozGyFZjpQhnCZmZmZ7P4rX1pVVRruzXyWdLd7/+7qTjd2yc1qOSMsbxJ0/9iEvXKjqg6Fi3Yq3E1nhDVI0L0jgouhsUIVd4RzrSC+l0QdivUk7hWC7qmPxsimcEoeaW3piLCeYEIzwsZaKmWO0T310RjZkG3BZh7dtDYE9msCMjcKXUVNzIriVYxkAe53jGlau0DEn+5dpAQmXKZNHGmdrBc3C4JsQkFYlpNvvgMIi+T6hTK3JFvGWkpnZ082DtmaTD7kmz9x2eJE9redivW8Q2nRJMevTGnchHzIl+bIkzhlgiy2aJko3Oe59Scf8gVbWs9tXSr3Cy+iRQ82QUJeK0i+oZ3B9ciVY/+fWzV2ydwVrOorutI3AiPAVPA1KG5wq0+uQAZPUgf50hxeqe3V7j/3b5zjAFI99lmL3uwY/Kpny16sqxo4BgLgJLgD5upc2rD+IOMmaEkDvt6+XsM/nxaUBHVWjsST3bZOKV4+gCAOrnE6y7JuAZwBvE7wOHgdkM1OJrxFF8gXZDjygzllJTH2IAIIjBf9nbLP3mtPTPXywRSP7WtdtxuMNpj+BcaB/5ngFFAMPMOePZmG0of+r8PF2KAkqomPFE9H9qla9vzOpU8/bfyIPGF4tjPRI6wCmdVqDAbpDXs/3bsEKrCTghgvJmRdhVQ3P4eyT/V0/KZI9q0OWMiyfTM743GC+o0WgBA7J6vs66V47LfA8URL9l88Vu7VIA1k28a+klhaEmKPoxK3YkR/vYcXn4fvomX/pG1gDjfLsyz7cJCjhgoMBNgR/i4PDSLzDAogzcWbHaVFgb4qdL+JrXg/G8+2jXsvtmUoADXjgYG1jra1aeshiG0mfpXBesDr+qJY9r1AEmhm8BkCipsFAfFt2A2BMaJ6/7hOcvGvh7YeH2Xi87Wu1A4whT3vBxXBZDDQUJ29oL3paxDUKK0KvrjX9Kv/R+39u23/m/j4SNDAeWDTbc8bQAZ/gCT2XMt8Haj/UwDgR92n1/ZDqAL2riY+pcA0cAsEwCrQwWAjgFMsuMusaqYNO6GLVoGPYn+415nm4b2h/c8vf8SCKgPKgaxaSdA8G5uiEF+uBfBhrJf1aWEXQ/YbWRWik8LCKhUp4Db2k2mVsACjtfILsRt79+5d7MGd8JStFQI4wipxFoHIOA/eXOHtWDOvopG+2BqyoL4xXoyVIX6WiR8JFxa2MnVY7WpfC+shEifhNS0QBn0dwRowL81jV3AdCrs+yU+5u2PC7uMFtY/kix0KEQWrfB5Ov9UQO6YJMjB2DddI+d3F2f+LWultVzXFa/sMJ+MEBLA+hQVkJOlJV0jABCy2a2ADhCfi+pn8cXze/zX1xhqhsyLda+fT3PxLEP+AAlztcX0tif6vSUAS4z5ANV6CED9e9N+dFCSOCYNRAADkSRuoRilhAQAAAABJRU5ErkJggg==&style=flat-square&labelColor=efefef)](#---)
[![GLMakie:0.11.5](https://img.shields.io/badge/GLMakie-0.11.5-676767.svg?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAA+VBMVEVHcEyakW4/grHidkmvf2lxiY3YjUfkySjlrTLcMmXeQl9YfaO+t0njhkK6rFCkToHVZVg9hrFEiaygToRScqrcekuXUoiWVIjdP2DcMmU0g7fOwDu2RHl9oHxJdq7gX1J6moBya5fnyyXcMmXjkz3nwSnnyyUwgbpZkprgXlPNOm3MvzzkkzybpWaWXoTcMmUwgbrnyiU0gLlDiKs5g7XfUljPOmw/e7PdOWPkoDfaxTDAQHPGvEHjySnnwSpQjKHRwDjcZ1NLd62ySXrkkz3muC5cj5hecqLeSFx4noFmlZCws1OwoFutZHPMWWJ6gYrRpkLkmTq7cGWnSnXnAAAAL3RSTlMAI1UoEQl8j/7O/jT1/lP5T5sdV8tFcP5x1N8p09Hwj4qmc6abz6K2eOPOiMbDwPsTYTsAAAFUSURBVCiRjdJnc4JAEAbgpZwxQlCssSSa3sOBhajYMEoUUZP//2Nyd6CC0Zm8X9jhmd2FA4D/JXYrAKDq+QFS4u3PMwFGza9Eao/KdxOKsRzBD60ohO1e7/uYYqhpN1u61vUABfGpmaCoacHqE52mTzAHIG5QOw3jJP5NV22xGMX2K0DV37nX2aOt5IFGm9Yd9nqdznC9Jq+yXLZaEWRkWfIilvrxxt0u4wAZybK7WCic5yXHY6YBdoZDqwzAvXEgovdCPlOhzQGSiQqraqvVFSuSZPYzq14s2fWPYz51HKZ5MrvCbomy6yJWTQe2k6VFplBIZvwGpHDsyg/qpm3zABIS89z26LlZLS0+DuqNhmna2azjSKFPdjGbzafUDIMwab+MILV6A2ODxjTDKPlmYBbCfPhXQOrOMH5AEI1U2lhJgr/hfeMPEI2KsXqESNLp47afXwyMR7CZkyqOAAAAAElFTkSuQmCC&style=flat-square&labelColor=efefef)](#---)
[![Flux:0.16.4](https://img.shields.io/badge/Flux-0.16.4-676767.svg?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAA3lBMVEVHcEyfKyxJab4rgChMkT8cXBgrLi4wU7CjMDAgOR25SUgXHxgwUqxDY7sgfxsyhC8kJCQmJiYeRaA1V7KgMDCmNDS5REYsO2mpMDGfIyoqOFCxPz4vVKQufRmfPDMmJiYjIyM6W7RYKCg4WbMqQX+bJidjUxw2gS3WaGW3TEjUZ2Nog9cqKShuq19anUDaamZsh91nr19khMluid9doFFlo1dvrGBWc8tYnUttiNzNX1wADBxgfNHJVlYeKChgOTh5Q0FFV39QgJZYbKtniM8kKglmh81fdbubX0RvllPWgBNPAAAAKHRSTlMAVvw6/hP8ZIUf9Vg+yyesq9knbZeP6Px1QvzbhIL2y3tLuO+uYW/ZY9XCawAAAP9JREFUKJHNkdtSwjAURdNLShugBWEAR8S7hpKaatJQWq7e/f8fMklbRmcsj47rIfvMrNnn4QSA/43XOSC7pN6dE9KsXUoc56xONh1C1r8Jw3Xd0SUhfbeif1ypQYbDkG7XGxoqMF6dGIW6QRmWLqSbfEtLVdZGKKO4gGI9rSa3vmVZPjAmU4QGaPqNj0+eJNwOoO7CIH1QJHnOVUYisk+LtX6QChEpRJIIHZWy7mzO03tNyrkK+2kuMa9aAHoehGPzUfK2e3VeZMaMsWW7VZQb5owtJOx996yHxV6NzeWsJGaxinn7qLzNRa+xZzi8lm+vUj858GEAdLpevfwjvgCbbSmebmtXfwAAAABJRU5ErkJggg==&style=flat-square&labelColor=efefef)](#---)
[![FFTW:1.9.0](https://img.shields.io/badge/FFTW-1.9.0-676767.svg?logo=&style=flat-square&labelColor=efefef)](#---)
[![PyCall:1.96.4](https://img.shields.io/badge/PyCall-1.96.4-676767.svg?logo=&style=flat-square&labelColor=efefef)](#---)
[![Sympy:1.13.3](https://img.shields.io/badge/Sympy-1.13.3-676767.svg?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAA/1BMVEVHcEwzYSt+f2I7ExoxUitupUSal459eWY/PFSQjHtWaT9BSEOMiIIZJxs3UizezISFhIddhDsvViZmZUtteFFxj0POxKCdICBqPShZkjtOeDRGaTCPr1Jvh0S1sJy9tKJ+f3Di0IfdzITTwn+6sIS+s4WclXZhoD2zqH1uukI6dzJTmDvk1ImqnnuTgFcSQRWSy1NnsEB3tkeDtVDGs3S5pWt2wUXEuYqj01pbhj0pSB6Ow1BMiDg/Si11hVK/tJW322NNUDvn3bSdj2nv248vVymPkW5uZ0q3roBZYj+kmGp0dkyyrZCNckyIpmzM52/06sLg0qeumWLWy6Sjx18eIgS1AAAAIXRSTlMA+v4ooP6IqQ6JhyBnQ1PyRseR6dKu/Dp+7LW325uutsHJpeCZAAABh0lEQVQokbXSZ3ObQBAGYEAiltUse1zSk+OAA47eRG9qVpfs/P/f4hOTySDb+Zbs1+fevdnZpaj/XL3R36TT/zmf397dfesOW6/lB+M4sYMcFNsB+7Xb6vR+y+j7/SEzbcUombm4mawz1o5Z9rrGSy3PxcAyFvnxeKieD1WuLWXTZL/UCDgYmkp5Xx2r6nkjitL4FgemZQ1OyEGAHGXBb3JN1B4FnhcubmTk+9d10tuiwlpM4VzgV8QIUoPu508fW6ck2NKBg8OMkTSJl2qs64Gi+leqm2L71z6wUcjwpLF08WfID1ckmia2Ge/Ig1AXJo8N5Djg6uVMwdiKiwKJq/EZqh6Ai3RGJzLeFcmk2ZYEXQCAty6XM8ve+8xZEj6pQIUqFMd66Bdm2UAyp64/eS6AoqBl8s5OG9gXuCnn6ZCgJGW+Y6Vat7Gw0XLFTacEJ0Io+7jdOdvnwDAi3SXJtYwSpffqDoZRFBlRgmQZK+03V9JrzyIDYUV5x04/D9s0Td+03rN/XS/NIkLO0MmWJQAAAABJRU5ErkJggg==&style=flat-square&labelColor=efefef)](#---)

<div align="justify" style="width:750px">

Understanding the nature of light and how to control it, in classical and quantum regime, represents a research area of significant impact nowadays, driven largely by the emergence of quantum technologies as a proeminent source of novel applications. This `Julia` toolkit aims to provide a simple but widely applicable framework for academic research on photonics, specially in the context of guided waves design - but also is capable to approach on bulk optics and non-linear effects. It's mainly designed for simulations on experimental contexts, via numerical methods, but also comprehends theoretical utils on algebraic manipulation of optical modes - in both contexts, classical and quantum.

##      License

This toolkit was implements under [MIT License](./LICENSE).

<!-- 
##      Features and capabilites

This toolkit was design to approach photonic chip design both on classical and quantum optics. The toolkit is divided through three main capabilities

*   **Classical waveguide optics.**
    Numerical and analytical approach on paraxial guidewave optics, besides some phase optimization algorithms for bulk optics.

*   **Optical waveguides design.**
    Design of optical waveguides through phase optimization methods, besides some estimations through neural networks.

*   **Quantum optics.**
    Analytical approach on quantum states of light (both in Fock space and as polarization states), and numerical simulations of its propagation through photonic chips.

###     Classical optics

>   The submodule designed to classical optics is widely inspired on [FiniteDifferenceBPM](https://github.com/Windier/FiniteDifferenceBPM/) `Matlab library` implemented by [José Carlos do A. Rocha](https://github.com/Windier/).

The main features of classical optics submodule consists in:

- **Symbolic manipulation of modes.** Robust tools on algebraic manipulation of free-space expression of classical modes which allows also numerical evaluations.
- **Numerical propagation of fields.** Fourier and Finite-Differences beam propagation methods to estimate waveguides and nonlinear responses effects on light propagation in the paraxial approximation through photonic chips.
- **Polarization optics.** Symbolic and numerical methods of classical optics is also implemented for media with polarization effects.
- **Phase optimization.** Numerical methods on phase optimization to implement unitary transformations over classical light.

###     Quantum optics

The main features of quantum optics submodule consists in:

- **Symbolic manipulation of light quantum states.** Robust tools on algebraic manipulation of light quantum states, both as optical modes and as polarization states.
- **Numerical propagation of photons.** Numerical methods on photon propagation through photonic chips.
-->

##      Usage examples

Some [examples of usage](./examples/README.md) are available in this repository.

##      Cite us

If you find this toolkit useful in your research, please cite this repository as:

```tex
@Misc{PhotonX2025,
    author       = {Carlos Antunis Bonfim da Silva Santos},
    title        = {PhotonX.jl},
    howpublished = {Github: https://github.com/carlos-antunis-physics/PhotonX.jl},
    year         = {2025},
}
```

</div>

</div>
