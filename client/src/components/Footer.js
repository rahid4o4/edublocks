import React from "react";
import "../styles/Footer.css";

const Footer = () => {
  const date = new Date();
  const year = date.getFullYear();

  return (
    <div className="footer">
      <p>&copy;{year} Rahid syed</p>
      <div className="links">
        <a href="https://github.com/rahid4o4" rel="noreferrer" target="_blank">
          <i className="fab fa-github-square"></i>
        </a>
        <a href="https://linkedin.com/in/syed-ahmed-shah-rahid-9a23a9170" rel="noreferrer" target="_blank">
          <i className="fab fa-linkedin"></i>
        </a>
      </div>
    </div>
  );
};

export default Footer;
