<!--
*** See https://github.com/othneildrew/Best-README-Template for a great README template
-->

<!-- PROJECT SHIELDS -->
<!--
*** Markdown "reference style" links are used here for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for the actual URLs.
*** See: https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
# UXID [![Issues][issues_shield]][issues_url] [![MIT License][license_shield]][license_url]

This project contains the specification and reference implementations of a type of unique identifier called a UXID.

UXID stands for **U**ser e**X**perience focused **ID**entifier and is similar to a [ULID][ulid_url], with a strong focus on UX.

## Why UXIDs?

ID generation is a fun topic (for some :) and there are many existing libraries to do so (see [Alternatives]).
ID generation is a fun topic (for some :) and there are many existing libraries to do so (see [Alternatives](#alternatives)).
UXIDs build on strong concepts from some of these alternatives and have these primary goals:

  * User experience focused
  * No coordination, no collisions, no (fixed) cardinality
  * Sortable by time

### User Experience Focused

Most ID generation libraries focus on creating unique identifiers to work for the system (often distributed) and give little thought to the humans who use them.

Who are these humans you speak of? There are two large groups:

* The customer and tech support heros who need to easily pronounce and hear them over the phone.
* The engineers investigating a complex issue with multiple objects of different types.


<!-- PROJECT LOGO -->
<!--
<br />
<p align="center">
  <h1 align="center">UXID</h1>

  <p align="center">
    <b>U</b>ser e<b>X</b>perience focused <b>ID</b>entifiers
    <br />
    <br />
    <a href="https://github.com/riddler/uxid/issues">Report Bug / Request Feature</a>
  </p>
</p>
-->


<!-- TABLE OF CONTENTS -->
## Table of Contents

  * [About the Project](#about-the-project)
  * [Getting Started](#getting-started)
    * [Installation](#installation)
  * [Roadmap](#roadmap)
  * [Contributing](#contributing)
  * [License](#license)
  * [Contact](#contact)
  * [Alternatives](#alternatives)
  * [Acknowledgements](#acknowledgements)



<!-- ABOUT THE PROJECT -->
## About The Project

  UXIDs are identifiers which:
  
  * describe the resource (to help in debugging and investigation)
  * work well with copy and paste (double clicking should select the entire ID)
  * can be shortened for low cardinality resources
  * are very unlikely to collide
  * are secure against enumeration attacks
  * can be generated by application code (not tied to the datastore)
  * are K-sortable (lexicographically sortable by time - works well with datastore indexing)
  * do not require any coordination (human or automated) at startup, or generation


<!-- GETTING STARTED -->
## Getting Started

  To get a local copy up and running follow these simple steps.

  ### Installation

  1. Clone and cd into the repo
  ```sh
  git clone https://github.com/riddler/uxid.git
  cd uxid
  ```
  2. Install dependencies and setup the development environment
  ```sh
  ./bin/setup
  ```



<!-- ROADMAP -->
## Roadmap

  See the [open issues](https://github.com/riddler/uxid/issues) for a list of proposed features (and known issues).



<!-- CONTRIBUTING -->
## Contributing

  Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

  1. Fork the Project
  2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
  3. Commit your Changes (`git commit -m 'Adds some AmazingFeature'`)
  4. Push to the Branch (`git push origin feature/AmazingFeature`)
  5. Open a Pull Request

  See the [Contribution Guidelines][contribution_guidelines] for more information



<!-- LICENSE -->
## License

  Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

  JohnnyT - [@johnny_t](https://twitter.com/johnny_t)

  Project Link: [https://github.com/riddler/uxid](https://github.com/riddler/uxid)



<!-- ALTERNATIVES -->
## Alternatives

  * [Auth0 id-generator][auth0_id_generator_url]: Generates random ids with a prefix (a la Stripe).
  * [CID][cid_url]: Content ID - a human-friendly unique ID function built for use with mobile-first/distributed apps.
  * [GlobalID][global_id_url]: Reference models by URI - an app wide URI that uniquely identifies a model instance.
  * [KUSID][ksuid_url]: K-Sortable Unique IDentifier.
  * [ULID][ulid_url]: Universally Unique Lexicographically Sortable Identifier.
  * [XID][xid_url]: Globally Unique ID Generator based on the Mongo Object ID algorithm.


<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

  * [Best README Template][readme_template_url]
  * [Top Ten Reasons Why I Won't Use Your Open Source Project][top_ten_reasons_url]



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[issues_shield]: https://img.shields.io/github/issues/riddler/uxid.svg?style=flat-square
[issues_url]: https://github.com/riddler/uxid/issues
[license_shield]: https://img.shields.io/github/license/riddler/uxid.svg?style=flat-square
[license_url]: https://github.com/riddler/uxid/blob/master/LICENSE

[contribution_guidelines]: https://github.com/riddler/.github/blob/master/CONTRIBUTING.md

[auth0_id_generator_url]: https://github.com/auth0/id-generator
[cid_url]: https://github.com/dwyl/cid
[global_id_url]: https://github.com/rails/globalid
[ksuid_url]: https://github.com/segmentio/ksuid
[ulid_url]: https://github.com/ulid/spec
[xid_url]: https://github.com/rs/xid

[top_ten_reasons_url]: https://changelog.com/posts/top-ten-reasons-why-i-wont-use-your-open-source-project
[readme_template_url]: https://github.com/othneildrew/Best-README-Template
